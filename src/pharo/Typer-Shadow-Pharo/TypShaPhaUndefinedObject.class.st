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
	^ TypFunctionType new
		argumentTypes: [ BlockClosure typAsType ];
		resultType: [ :a :s :r | 
			| node |
			node := aLookup argumentNodes at: 1.
			(node isBlock
				and: [ node body statements size > 0
						and: [ node body statements last isReturn ] ])
				ifTrue: [ self flag: 'FIXME well?' ]
				ifFalse: [ (aLookup arguments at: 1) result ] ];
		yourself
]

{ #category : #shadow }
TypShaPhaUndefinedObject >> mIfNotNil: aLookup [
	<typShaMethod: 'ifNotNil:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {aLookup receiver asNonNullable}
				argumentsOptional: true
				signalsAlways: false)} typAsType}
]
