Class {
	#name : #TypShaPhaUndefinedObject,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaUndefinedObject class >> shadowedClass [
	^ UndefinedObject class
]

{ #category : #shadow }
TypShaPhaUndefinedObject >> mIfNil: aLookup [
	<typShaMethod: 'ifNil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1) result
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaUndefinedObject >> mIfNotNil: aLookup [

	<typShaMethod: 'ifNotNil:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isString ])
		     ifTrue: [ 
			     (aLookup root receiver
				      lookupMethod: a value asSymbol
				      arguments: #(  )) result ]
		     ifFalse: [ a result ].
	^ CompiledMethod
		  typAsFunctionTypeWithResult: r asNullable
		  arguments: { { 
				  Symbol typAsType.
				  (BlockClosure
					   typAsFunctionTypeWithResult: TypUnknownType new
					   arguments: { aLookup root receiver asNonNullable }
					   argumentsOptional: true
					   signalsAlways: false) } typAsType }
]
