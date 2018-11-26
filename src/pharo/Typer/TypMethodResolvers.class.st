Class {
	#name : #TypMethodResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolvers >> typTypeForArgumentAt: anInteger ofMethod: aCompiledMethod [
	^ self typTypeForArgumentAt: anInteger ofMethod: aCompiledMethod withDiscovered: Set new
]

{ #category : #accessing }
TypMethodResolvers >> typTypeForArgumentAt: anInteger ofMethod: aCompiledMethod withDiscovered: aSet [
	^ self typTypeFor: aCompiledMethod using: [ :r :m :s | r typTypeForArgumentAt: anInteger withDiscovered: s ] withDiscovered: aSet
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typTypeForResultForReceivers: aType ofMethod: aCompiledMethod [
	^ self typTypeForResultForReceivers: aType ofMethod: aCompiledMethod withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typTypeForResultForReceivers: aType ofMethod: aCompiledMethod withDiscovered: aSet [
	^ self typTypeFor: aCompiledMethod using: [ :r :m :s | r typTypeForResultForReceiver: aType withDiscovered: s ] withDiscovered: aSet
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typTypeForResultOfMethod: aCompiledMethod [
	^ self typTypeForResultOfMethod: aCompiledMethod withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typTypeForResultOfMethod: aCompiledMethod withDiscovered: aSet [
	^ self typTypeFor: aCompiledMethod using: [ :r :m :s | r typTypeForResultWithDiscovered: s ] withDiscovered: aSet
]
