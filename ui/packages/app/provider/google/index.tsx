// on Android, we don't use Google Auth Context, so we avoid the provider altogether
// instead, we just have a no-op here

export const GoogleProvider = ({
  children,
}: {
  children: React.ReactElement
}) => <>{children}</>
