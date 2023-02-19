export default function DateTimePicker({ onChangeDate, value }: {
  onChangeDate: (date: Date) => void
  value?: Date
}) {

  return <input onChange={(e) => e.target.valueAsDate && onChangeDate(e.target.valueAsDate)} type="datetime-local" value={value?.toISOString().slice(0,16)} />
}
