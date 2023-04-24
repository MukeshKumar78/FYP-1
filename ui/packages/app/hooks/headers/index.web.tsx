function useNoOpHeader(_: any) {
  return { createHeader: () => { } } // no-op for web since there is not header (yet)
}

export const useSocietyHeader = useNoOpHeader;
export const useUserHeader = useNoOpHeader;
export const useTextHeader = useNoOpHeader;

