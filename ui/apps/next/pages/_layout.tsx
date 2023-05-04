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

  if (!isSignedIn) {
    if (router.route !== '/login')
      router.replace('/login')
    else
      return <>{props.children}</>
  }

  if (isSignedIn && router.route == '/login')
    router.replace('/')

  return (
    <div style={{ display: 'flex', margin: '10px', justifyContent: 'center' }}>
      <SideBar />
      <PostBar {...props} />
    </div>
  )
}
