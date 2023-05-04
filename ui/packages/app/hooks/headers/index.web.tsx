import { NavigationContext } from "app/provider/navigation/index.web";
import { useContext, useState } from "react";

export function useHeader() {
  const { header, createHeader } = useContext(NavigationContext)

  return { header, createHeader }
}

function useNoOpHeader(_: any) {
  return { createHeader: () => { } } // no-op for web since there is not header (yet)
}

export const useSocietyHeader = useNoOpHeader;
export const useUserHeader = useNoOpHeader;
export const useTextHeader = useNoOpHeader;

