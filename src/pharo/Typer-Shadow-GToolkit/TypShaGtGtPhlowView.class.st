Class {
	#name : #TypShaGtGtPhlowView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowView class >> shadowedClass [
	^ GtPhlowView class
]

{ #category : #accessing }
TypShaGtGtPhlowView >> ___actionStencil: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | BlockClosure typAsType asFunctionType: {} result: BlElement typAsType optionalParameters: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
