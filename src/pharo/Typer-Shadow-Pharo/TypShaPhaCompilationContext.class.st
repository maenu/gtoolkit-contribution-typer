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
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Dictionary typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mClass: aLookup [
	<typShaMethod: 'class:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {ClassDescription typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mForSyntaxHighlighting: aLookup [
	<typShaMethod: 'forSyntaxHighlighting:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Boolean typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mRequestor: aLookup [ 
	<typShaMethod: 'requestor:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Object typAsType asNullable ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
