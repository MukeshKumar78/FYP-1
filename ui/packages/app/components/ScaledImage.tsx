import { useState, useEffect } from "react";
import { Image } from 'react-native';

export function ScaledImage({ uri }: { uri: string }) {
  const [aspectRatio, setAspectRatio] = useState(1);

  useEffect(() => {
    if (!uri) {
      return;
    }
    Image.getSize(uri, (width, height) => {
      setAspectRatio(width / height);
    });
  }, []);

  return (
    <Image
      source={{ uri: uri }}
      style={{ width: '100%', aspectRatio }}
    />
  )
}
