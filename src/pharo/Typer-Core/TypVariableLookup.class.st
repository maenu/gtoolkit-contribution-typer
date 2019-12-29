Class {
	#name : #TypVariableLookup,
	#superclass : #TypObjectLookup,
	#category : #'Typer-Core-Lookup'
}

{ #category : #'as yet unclassified' }
TypVariableLookup >> emptyResult [
	^ TypVariableLookupResult new
		lookup: self;
		resolvedBy: self;
		yourself
]
