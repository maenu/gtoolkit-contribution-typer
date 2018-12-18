Class {
	#name : #TypGtCoderMethodsCollection,
	#superclass : #GtCoderMethodsCollection,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #converting }
TypGtCoderMethodsCollection >> asCoder [
	<typTypeResultAs: 'TypGtFilteredMethodsCoder'>
	^ TypGtFilteredMethodsCoder forMethods: self
]
