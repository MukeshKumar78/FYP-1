// Deprecated
// Replaced by RTKQuery

type ApiResponse = [
  boolean,
  object
]

const API_ROOT = 'localhost:8080';

export default function useApi(path: string) {

  function getHeaders(hasBody: boolean, token?: string) {
    const headers = { 'Accept': 'application/json' }
    if (hasBody) {
      headers['Content-Type'] = 'application/json'
    }
    if (token) {
      headers['Authorization'] = `Bearer ${token}`;
    }

    return headers;
  }

  function joinUrl(a: string, b: string): string {
    return path.startsWith('/')
      ? a + b
      : a + '/' + b
  }

  async function handleResponse(requestWithTimeout: Promise<Response>)
    : Promise<ApiResponse> {

    const response = await requestWithTimeout;
    const ok = response.ok;
    if (ok) {
      const body = await response.json();
      return [ok, body];
    }

    // try to get error message
    try {
      let error = await response.json();
      if (error && error.message)
        error = error.message;

      return [ok, error];
    }
    catch (e) {
      return [ok, {}];
    }
  }

  function timeout(request: Promise<Response>, ms: number): Promise<Response> {
    return new Promise((resolve, reject) => {
      const timer = setTimeout(() => reject(new Error('timeout')), ms);
      request
        .then(response => {
          clearTimeout(timer);
          resolve(response);
        })
        .catch(reject);
    })
  }

  async function request(method: string, api: string, body?: BodyInit) : Promise<ApiResponse> {
    const headers = getHeaders(!!body);
    const endpoint = joinUrl(API_ROOT, api);
    const options = body
      ? { method, headers, body }
      : { method, headers }

    return await handleResponse(
      timeout(fetch(endpoint, options), 5000)
    )
  }

  function get(api: string) {
    return request('get', joinUrl(path, api));
  }

  function post(api: string, body?: BodyInit) {
    return request('post', joinUrl(path, api), body);
  }

  return { get, post };
}
