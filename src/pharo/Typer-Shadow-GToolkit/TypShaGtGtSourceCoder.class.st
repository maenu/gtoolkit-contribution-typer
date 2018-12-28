Class {
	#name : #TypShaGtGtSourceCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtSourceCoder class >> shadowedClass [
	^ GtSourceCoder class
]

{ #category : #accessing }
TypShaGtGtSourceCoder >> ___expanded: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Boolean typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
