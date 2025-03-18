import { Text, View, StyleSheet } from 'react-native';
import { Keys } from 'nostr-sdk-react-native';

const keys = Keys.generate();

export default function App() {
  return (
    <View style={styles.container}>
      <Text>Public Key: {keys.publicKey().toHex()}</Text>
      <Text>Secret Key: {keys.secretKey().toHex()}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    gap: 4,
  },
});
