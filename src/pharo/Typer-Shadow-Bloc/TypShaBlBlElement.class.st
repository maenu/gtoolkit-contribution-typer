Class {
	#name : #TypShaBlBlElement,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlElement class >> shadowedClass [
	^ BlElement class
]

{ #category : #shadow }
TypShaBlBlElement >> mBackground: aLookup [
	<typShaMethod: 'background:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{{Color typAsType.
			BlBackground typAsType} typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBlBlElement >> mConstraintsDo: aLookup [
	<typShaMethod: 'constraintsDo:'>
	CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {BlLayoutConstraints typAsType}
				argumentsOptional: false
				signalsAlways: false)}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBlBlElement >> mFireEvent: aLookup [
	<typShaMethod: 'fireEvent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {BlEvent typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBlBlElement >> mGeometry: aLookup [
	<typShaMethod: 'geometry:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {BlGeometry typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBlBlElement >> mLook: aLookup [
	<typShaMethod: 'look:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{{BrLook class typAsType.
			BrLook typAsType} typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBlBlElement >> mMargin: aLookup [
	<typShaMethod: 'margin:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {BlInsets typAsType}
		argumentsOptional: false
		signalsAlways: false
]
