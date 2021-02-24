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
		argumentTypes:
				[ :i :a :s :r | BlockClosure typAsFunctionTypeWithResult: TypUnknownType new ];
		resultType: [ :a :s :r | 
			| node |
			node := a argumentNodes at: 1.
			(node isBlock
				and: [ node body statements size > 0
						and: [ node body statements last isReturn ] ])
				ifTrue: [ TypNoTypeError signal ]
				ifFalse: [ (a argumentTypes at: 1) result ] ];
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
