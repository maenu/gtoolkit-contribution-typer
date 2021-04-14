Class {
	#name : #TypShaSmaSmaCCToken,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-SmaCC'
}

{ #category : #'as yet unclassified' }
TypShaSmaSmaCCToken class >> shadowedClass [
	^ SmaCCToken class
]

{ #category : #shadow }
TypShaSmaSmaCCToken >> mStopPosition: aLookup [
	<typShaMethod: 'stopPosition'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType asNullable
]

{ #category : #shadow }
TypShaSmaSmaCCToken >> mValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
