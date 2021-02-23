Class {
	#name : #TypShaBlBlText,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlText class >> shadowedClass [
	^ BlText class
]

{ #category : #shadow }
TypShaBlBlText >> mAttribute: aLookup [
	<typShaMethod: 'attribute:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {BlTextAttribute typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBlBlText >> mAttributesAt: aLookup [
	<typShaMethod: 'attributesAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {BlTextAttribute typAsType})
		arguments: {Integer typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBlBlText >> mClearAttributes: aLookup [
	<typShaMethod: 'clearAttributes:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {BlTextAttribute typAsType}
				argumentsOptional: false
				signalsAlways: false)}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBlBlText >> mFromTo: aLookup [
	<typShaMethod: 'from:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BlText typAsType
		arguments: {Integer typAsType}
		argumentsOptional: false
		signalsAlways: false
]
