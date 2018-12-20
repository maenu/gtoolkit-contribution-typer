Class {
	#name : #TypShaPhaStream,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaStream class >> shadowedClass [
	^ Stream class
]

{ #category : #accessing }
TypShaPhaStream >> asType: aClass [
	^ (super asType: aClass) asParametricType: {TypUnknownType instance}
]

{ #category : #accessing }
TypShaPhaStream >> ~~~<< _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{TypUnknownType instance.
			(Collection typAsType asParametricType: {(a receiverType parameters at: 1)})} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
