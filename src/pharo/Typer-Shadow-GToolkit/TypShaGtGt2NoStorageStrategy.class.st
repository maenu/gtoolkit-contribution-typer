Class {
	#name : #TypShaGtGt2NoStorageStrategy,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGt2NoStorageStrategy class >> ___uniqueInstance [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGt2NoStorageStrategy class >> shadowedClass [
	^ Gt2NoStorageStrategy class
]
