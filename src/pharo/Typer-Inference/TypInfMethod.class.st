Class {
	#name : #TypInfMethod,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMethod >> inReturns [
	^ in
		at: #return
		ifPresent: [ :s | s collect: #origin ]
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfMethod >> methodNode [

	^ self
]

{ #category : #accessing }
TypInfMethod >> transfer [
	state
		at: self
		put: (CompiledMethod
				typAsFunctionTypeWithResult: (self inReturns collect: #type) typAsMinimizedType
				arguments: (self inArguments collect: #type)
				argumentsOptional: false
				signalsAlways: nil)
]
