Class {
	#name : #TypShaSmaSmaCCParser,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-SmaCC'
}

{ #category : #shadow }
TypShaSmaSmaCCParser class >> mParse: aLookup [

	<typShaMethod: 'parse:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { String typAsType }
]

{ #category : #'as yet unclassified' }
TypShaSmaSmaCCParser class >> shadowedClass [
	^ SmaCCParser class
]
