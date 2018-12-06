Class {
	#name : #TypGtCoderMethodsCollection,
	#superclass : #GtCoderMethodsCollection,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #converting }
TypGtCoderMethodsCollection >> asCoder [
	^ TypGtMethodsCoder forMethods: self
]
