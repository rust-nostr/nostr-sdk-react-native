import { Text, View, StyleSheet } from 'react-native';
import { Keys } from 'nostr-sdk-react-native';

const keys = Keys.generate();

export default function App() {
  return (
    <View style={styles.container}>
      <Text>Result: {keys.publicKey().toBech32()}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
