Class {
	#name : #TypShaGtGtNoStorageStrategy,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtNoStorageStrategy class >> mUniqueInstance: aLookup [ 
	<typShaMethod: 'uniqueInstance'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtNoStorageStrategy class >> shadowedClass [
	^ GtNoStorageStrategy class
]
