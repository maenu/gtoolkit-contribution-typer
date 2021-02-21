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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{Color typAsType.
			BlBackground typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaBlBlElement >> mConstraintsDo: aLookup [ 
	<typShaMethod: 'constraintsDo:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {BlLayoutConstraints typAsType}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaBlBlElement >> mFireEvent: aLookup [ 
	<typShaMethod: 'fireEvent:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | BlEvent typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaBlBlElement >> mGeometry: aLookup [ 
	<typShaMethod: 'geometry:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | BlGeometry typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaBlBlElement >> mLook: aLookup [ 
	<typShaMethod: 'look:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{BrLook class typAsType.
			BrLook typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaBlBlElement >> mMargin: aLookup [ 
	<typShaMethod: 'margin:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | BlInsets typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
