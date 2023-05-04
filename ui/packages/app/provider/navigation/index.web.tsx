// on Web, we don't use React Navigation, so we avoid the provider altogether
// instead, we just have a no-op here
// for more, see: https://solito.dev/recipes/tree-shaking

import { createContext, useEffect, useLayoutEffect, useState } from "react"
import { useRouter } from 'next/router'
import { H1 } from "app/components"

export const NavigationContext = createContext({
  header: <></>,
  createHeader: (component: JSX.Element) => { }
})

export const NavigationProvider = ({
  children,
}: {

  children: React.ReactElement
}) => {
  const [header, setHeader] = useState(<></>)
  const router = useRouter()

  const createHeader = (component: JSX.Element) => {
    setHeader(component)
  }

  useLayoutEffect(() => {
    console.log('context')

    setHeader(<H1>CampusMe</H1>)
  }, [router.route])

  return <NavigationContext.Provider value={{ header, createHeader }}> {children} </NavigationContext.Provider>
}
