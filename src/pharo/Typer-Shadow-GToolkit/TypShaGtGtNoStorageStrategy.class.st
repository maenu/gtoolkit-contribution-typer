Class {
	#name : #TypShaGtGtNoStorageStrategy,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtNoStorageStrategy class >> ___uniqueInstance [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtNoStorageStrategy class >> shadowedClass [
	^ GtNoStorageStrategy class
]
