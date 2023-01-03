import 'raf/polyfill'

const fixReanimatedIssue = () => {
  // FIXME remove this once this reanimated fix gets released
  // https://github.com/software-mansion/react-native-reanimated/issues/3355
  if (process.browser) {
    // @ts-ignore
    window._frameTimestamp = null
  }
}

fixReanimatedIssue()

import { Provider } from 'app/provider'
import Head from 'next/head'
import React from 'react'
import type { SolitoAppProps } from 'solito'
import Button from 'app/components/Button'

function MyApp({ Component, pageProps }: SolitoAppProps) {
  return (
    <>
      <Head>
        <title>CampusMe</title>
        <meta
          name="description"
          content="Expo + Next.js with Solito. By Fernando Rojo."
        />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <Provider>
        <div style={{padding: 30, display: 'flex'}}>
          <div style={{margin: 10, padding: 0}}>
          <Component {...pageProps} />
          </div>
          <div style={{boxShadow: '0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24)', width: '100%', borderRadius: 10, margin: 20}}>
            <Button style={{margin: 15}} title="Home" onPress={()=>{}}/>
            <Button style={{margin: 15}} title="Profile" onPress={()=>{}}/>
            <Button style={{margin: 15}} title="Settings" onPress={()=>{}}/>
            <Button style={{margin: 15}} title="Logout" onPress={()=>{}}/>
          </div>
        </div>
      </Provider>
    </>
  )
}

export default MyApp
