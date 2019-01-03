Class {
	#name : #TypShaBlBlElement,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlElement class >> shadowedClass [
	^ BlElement class
]

{ #category : #accessing }
TypShaBlBlElement >> ___background: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{Color typAsType.
			BlBackground typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBlBlElement >> ___constraintsDo: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asFunctionType: {BlLayoutConstraints typAsType}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBlBlElement >> ___fireEvent: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | BlEvent typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBlBlElement >> ___geometry: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | BlGeometry typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBlBlElement >> ___look: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{BrLook class typAsType.
			BrLook typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBlBlElement >> ___margin: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | BlInsets typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
