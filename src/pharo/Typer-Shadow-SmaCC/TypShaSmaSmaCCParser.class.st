Class {
	#name : #TypShaSmaSmaCCParser,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-SmaCC'
}

{ #category : #shadow }
TypShaSmaSmaCCParser class >> mParse: aLookup [ 
	<typShaMethod: 'parse:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaSmaSmaCCParser class >> shadowedClass [
	^ SmaCCParser class
]
