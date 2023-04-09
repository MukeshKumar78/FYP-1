export default function PostBar(props) {
  return (
    <div
      style={{
        borderWidth: '1px', // Fixed the border width to 1px
        width: '100%',
        maxWidth: 480,
        display: 'inline-flex',
        marginLeft: '11%',
        marginTop: '40px',
      }}
    >
      {props.children}
    </div>
  )
}
