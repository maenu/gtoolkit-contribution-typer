Class {
	#name : #TypShaPhaMagnitude,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaMagnitude class >> shadowedClass [
	^ Magnitude class
]

{ #category : #accessing }
TypShaPhaMagnitude >> ___max: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Magnitude typAsType ];
		resultType: [ :a :s :r | 
			{a receiverType.
			(a argumentTypes at: 1)} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaMagnitude >> ~~~< _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Magnitude typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]
