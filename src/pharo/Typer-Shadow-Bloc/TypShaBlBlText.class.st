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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {BlTextAttribute typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaBlBlText >> mClearAttributes: aLookup [ 
	<typShaMethod: 'clearAttributes:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {BlTextAttribute typAsType}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
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
