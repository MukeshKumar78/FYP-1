export let apiHost = 'gw.campusme.mohsinsh.tech'
export let apiUrl = `https://${apiHost}`;
export let websocketUrl = `wss://${apiHost}/ws/team/gs-guide-websocket`

if (process.env.NODE_ENV == 'development') {
  apiHost = '192.168.100.12:8080'
  apiUrl = `http://${apiHost}`;
  websocketUrl = `ws://${apiHost}/ws/team/gs-guide-websocket`
}

