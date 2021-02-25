Class {
	#name : #TypShaPhaCompilationContext,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaCompilationContext class >> shadowedClass [
	^ CompilationContext class
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mBindings: aLookup [
	<typShaMethod: 'bindings:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Dictionary typAsType}
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mClass: aLookup [
	<typShaMethod: 'class:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {ClassDescription typAsType}
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mForSyntaxHighlighting: aLookup [
	<typShaMethod: 'forSyntaxHighlighting:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Boolean typAsType}
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mRequestor: aLookup [
	<typShaMethod: 'requestor:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {TypUnknownType new asNullable}
]
