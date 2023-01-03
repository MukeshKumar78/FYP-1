import { ScaledImage } from 'app/components/ScaledImage';
import { View } from 'dripsy'
import { Image, StyleSheet } from 'react-native';
import { ButtonWithChildren } from '../../components/Button';
import Text from '../../components/Text';
import EventOptionsModal from './event-options-modal';
import { Ionicons } from '@expo/vector-icons';


export default function EventDetails({ data }: { data: SocietyEvent }) {
  console.log(data);


  return (
    <View
      sx={{
        width: '100%',
        borderWidth: 0.5,
        borderRadius: 10,
        borderColor: 'gainsboro',
        backgroundColor: "$background",
      }}
    >
      <View sx={{ backgroundColor: '#EFEFEF', flexDirection: 'row', alignItems: 'center', flex: 1 }} >
        <Image
          style={{ margin: 5, width: 50, height: 50, borderRadius: 50 }}
          source={{ uri: data.society.image }}
        />
        <View sx={{ flexDirection: 'column', alignItems: 'flex-start', justifyContent: 'flex-start' }}>
          <Text style={{ fontWeight: 'bold' }}>{data.society.title}</Text>
          <Text style={{ color: 'gray' }}>{data.startDate.toLocaleString()} - {data.endDate.toLocaleString()}</Text>
        </View>
        <EventOptionsModal style={{ right: 10, position: 'absolute' }} />
      </View>

      <View style={{ padding: 10 }}>
        <Text style={{ fontSize: 24, fontWeight: 'bold', padding: 10 }}>{data.title}</Text>
        <ScaledImage uri={data.image} />
        <Text style={{ padding: 4 }}>{data.text}</Text>
      </View>
        <View sx={{ flexDirection: 'row', justifyContent: 'center', alignItems: 'center', flex: 1 }} >
          <ButtonWithChildren style={styles.interactiveButton} onPress={() => { }}>
            <Ionicons name="star" {...interactiveButtonProps} />
          </ButtonWithChildren>
          <ButtonWithChildren style={styles.interactiveButton} onPress={() => { }}>
            <Ionicons name="chatbox" {...interactiveButtonProps} />
          </ButtonWithChildren>
          <ButtonWithChildren style={styles.interactiveButton} onPress={() => { }}>
            <Ionicons name="share" {...interactiveButtonProps} />
          </ButtonWithChildren>
        </View>
    </View>
  )
}

const interactiveButtonProps = {
  size: 20,
  color: 'gray',
}

const styles = StyleSheet.create({
  interactiveButton: {
    backgroundColor: '#EFEFEF'
  }
})
