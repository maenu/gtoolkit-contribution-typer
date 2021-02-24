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
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{{Color typAsType.
			BlBackground typAsType} typAsType}
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
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {BlEvent typAsType}
]

{ #category : #shadow }
TypShaBlBlElement >> mGeometry: aLookup [
	<typShaMethod: 'geometry:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {BlGeometry typAsType}
]

{ #category : #shadow }
TypShaBlBlElement >> mLook: aLookup [
	<typShaMethod: 'look:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{{BrLook class typAsType.
			BrLook typAsType} typAsType}
]

{ #category : #shadow }
TypShaBlBlElement >> mMargin: aLookup [
	<typShaMethod: 'margin:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {BlInsets typAsType}
]
