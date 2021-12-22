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
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{Color typAsType.
			BlBackground typAsType} typAsType}
]

{ #category : #shadow }
TypShaBlBlElement >> mConstraintsDo: aLookup [

	<typShaMethod: 'constraintsDo:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: aLookup root receiver
		  arguments: { (BlockClosure
				   typAsFunctionTypeWithResult: TypUnknownType instance
				   arguments: { BlLayoutConstraints typAsType }) }
]

{ #category : #shadow }
TypShaBlBlElement >> mFireEvent: aLookup [
	<typShaMethod: 'fireEvent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlEvent typAsType}
]

{ #category : #shadow }
TypShaBlBlElement >> mGeometry: aLookup [
	<typShaMethod: 'geometry:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlElementGeometry typAsType}
]

{ #category : #shadow }
TypShaBlBlElement >> mLook: aLookup [
	<typShaMethod: 'look:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{BrLook class typAsType.
			BrLook typAsType} typAsType}
]

{ #category : #shadow }
TypShaBlBlElement >> mMargin: aLookup [
	<typShaMethod: 'margin:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlInsets typAsType}
]
