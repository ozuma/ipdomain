#!/usr/bin/env python3

import os
import requests

# urlscan.ioのAPIエンドポイント
SEARCH_API_URL = 'https://urlscan.io/api/v1/search/'

def get_unique_fqdns(search_query: str) -> list | None:
    """
    urlscan.ioで検索し、結果から一意のFQDNリストを取得します。

    Args:
        search_query (str): urlscan.ioの検索クエリ。
                            (例: 'page.domain:example.com')

    Returns:
        list | None: 成功した場合は一意のFQDNのリスト、失敗した場合はNoneを返します。
    """
    # 環境変数からAPIキーを取得
    api_key = os.getenv('URLSCAN_API_KEY')
    if not api_key:
        print("エラー: 環境変数 'URLSCAN_API_KEY' が設定されていません。")
        return None

    headers = {'API-Key': api_key}
    params = {'q': search_query}

    try:
        print(f"\n🔍 '{search_query}' で検索を実行中...")
        response = requests.get(SEARCH_API_URL, headers=headers, params=params)
        
        # HTTPエラー (4xx, 5xx) が発生した場合、例外を発生させる
        response.raise_for_status()

        data = response.json()
        results = data.get('results', [])

        if not results:
            print("✅ 検索結果が見つかりませんでした。")
            return []

        # 結果からFQDN (page.domain) を抽出し、Noneを除外する
        # APIのレスポンスでは、各結果の 'page' オブジェクト内に 'domain' が含まれています。
        fqdns = [
            result.get('page', {}).get('domain')
            for result in results
            if result.get('page', {}).get('domain') is not None
        ]

        # set() を使って重複を排除し、アルファベット順にソートしたリストを返す
        unique_fqdns = sorted(list(set(fqdns)))
        return unique_fqdns

    except requests.exceptions.HTTPError as http_err:
        if http_err.response.status_code == 401:
            print("❌ 認証エラー: APIキーが無効か、権限がありません。")
        elif http_err.response.status_code == 429:
            print("❌ APIレートリミットを超えました。しばらく待ってから再試行してください。")
        else:
            print(f"❌ HTTPエラーが発生しました: {http_err}")
            print(f"   レスポンス内容: {http_err.response.text}")
    except requests.exceptions.RequestException as req_err:
        print(f"❌ ネットワーク関連のエラーが発生しました: {req_err}")
    except Exception as e:
        print(f"❌ 予期せぬエラーが発生しました: {e}")

    return None

if __name__ == "__main__":
    # ユーザーから検索クエリを入力してもらう
    # 参考クエリ: https://urlscan.io/docs/search/
    query = input("urlscan.ioの検索クエリを入力してください (例: page.domain:google.com AND country:JP): ")

    if query:
        fqdn_list = get_unique_fqdns(query)
        
        if fqdn_list is not None:
            print("\n--- 検出された一意のFQDNリスト ---")
            if fqdn_list:
                for fqdn in fqdn_list:
                    print(f"{fqdn}")
                print(f"\n📊 合計: {len(fqdn_list)}件の一意なFQDNが見つかりました。")
            else:
                # 検索結果はあったが、FQDNが含まれていなかった場合も考慮
                print("(リストは空です)")
    else:
        print("検索クエリが入力されませんでした。プログラムを終了します。")
