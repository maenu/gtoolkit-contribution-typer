Class {
	#name : #TypShaGtGtNoStorageStrategy,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtNoStorageStrategy class >> ___uniqueInstance [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtNoStorageStrategy class >> shadowedClass [
	^ GtNoStorageStrategy class
]
