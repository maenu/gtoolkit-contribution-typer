Class {
	#name : #TypShaGtGtMethodCoderAdded,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoderAdded class >> shadowedClass [
	^ GtMethodCoderAdded class
]

{ #category : #accessing }
TypShaGtGtMethodCoderAdded >> ___methodCoder: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtMethodCoder typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
