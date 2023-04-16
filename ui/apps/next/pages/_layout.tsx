import { useAuth } from "app/features/auth/hooks";
import { PropsWithChildren } from "react";
import { LoadingScreen } from 'app/features/loading/screen'
import { useRouter } from 'next/router'
import SideBar from '../../../packages/app/components/SideBar/SideBar'
import PostBar from '../../../packages/app/components/PostBar/PostBar'

export default function Layout(props: PropsWithChildren) {
  const router = useRouter();
  const { isSignedIn, loading } = useAuth();

  // probably not best to do routing here 
  if (loading)
    return <LoadingScreen />

  if (!isSignedIn && router.route !== '/login') {
    router.replace('login')
  }

  if (isSignedIn && router.route == '/login')
    router.replace('/')

  return (
    <div style={{ display: 'flex', justifyContent: 'center' }}>
      <SideBar />
      <PostBar {...props}></PostBar>

      {/* TODO: sidebar and navbar components */}
      {/* <div style={{margin: 10, padding: 0}}> */}
      {/* </div> */}
      {/* <div style={{boxShadow: '0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24)', width: '100%', borderRadius: 10, margin: 20}}> */}
      {/*   <Button style={{margin: 15}} title="Home" onPress={()=>{}}/> */}
      {/*   <Button style={{margin: 15}} title="Profile" onPress={()=>{}}/> */}
      {/*   <Button style={{margin: 15}} title="Settings" onPress={()=>{}}/> */}
      {/*   <Button style={{margin: 15}} title="Logout" onPress={()=>{}}/> */}
      {/* </div> */}
    </div>
  )
}
