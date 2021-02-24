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
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {Dictionary typAsType}
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mClass: aLookup [
	<typShaMethod: 'class:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {ClassDescription typAsType}
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mForSyntaxHighlighting: aLookup [
	<typShaMethod: 'forSyntaxHighlighting:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {Boolean typAsType}
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mRequestor: aLookup [
	<typShaMethod: 'requestor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {Object typAsType asNullable}
]
