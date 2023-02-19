import { GoogleOAuthProvider } from '@react-oauth/google';

export const GoogleProvider = ({
  children,
}: {
  children: React.ReactElement
}) => {
  return <GoogleOAuthProvider clientId="570750294495-n51ofopug72nbpksust44519qmm83fmq.apps.googleusercontent.com">
    <>
    {children}
    </>
  </GoogleOAuthProvider>;
}
