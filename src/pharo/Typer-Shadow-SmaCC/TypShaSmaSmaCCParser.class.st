Class {
	#name : #TypShaSmaSmaCCParser,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-SmaCC'
}

{ #category : #shadow }
TypShaSmaSmaCCParser class >> mParse: aLookup [
	<typShaMethod: 'parse:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {String typAsType}
]

{ #category : #'as yet unclassified' }
TypShaSmaSmaCCParser class >> shadowedClass [
	^ SmaCCParser class
]
