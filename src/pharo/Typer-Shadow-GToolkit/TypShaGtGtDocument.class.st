Class {
	#name : #TypShaGtGtDocument,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtDocument class >> shadowedClass [
	^ GtDocument class
]

{ #category : #accessing }
TypShaGtGtDocument >> ___asElement [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlElement typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtDocument >> ___strategy: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Gt2StorageStrategy typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtDocument >> ___text: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{String typAsType.
			BlRope typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
