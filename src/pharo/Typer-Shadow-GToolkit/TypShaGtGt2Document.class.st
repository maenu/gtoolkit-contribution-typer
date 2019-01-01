Class {
	#name : #TypShaGtGt2Document,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGt2Document class >> shadowedClass [
	^ Gt2Document class
]

{ #category : #accessing }
TypShaGtGt2Document >> ___asElement [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlElement typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGt2Document >> ___strategy: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Gt2StorageStrategy typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGt2Document >> ___text: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{String typAsType.
			BlRope typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
