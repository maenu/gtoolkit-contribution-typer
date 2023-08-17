Class {
	#name : #TypShaExamples,
	#superclass : #Object,
	#category : #'Typer-Shadow-Examples'
}

{ #category : #accessing }
TypShaExamples >> lookupMethod [
	<gtExample>
	| lookup |
	lookup := TypMethodLookup
			receiver: Collection typAsType
			selector: #anyOne
			arguments: #()
			parent: nil.
	self assert: (TypShaMethodResolver new canResolve: lookup).
	^ TypShaMethodResolver new resolve: lookup
]

{ #category : #accessing }
TypShaExamples >> lookupMethodClassSide [
	<gtExample>
	| lookup |
	lookup := TypMethodLookup
			receiver: Color class typAsType
			selector: #purple
			arguments: #()
			parent: nil.
	self assert: (TypShaMethodResolver new canResolve: lookup).
	^ TypShaMethodResolver new resolve: lookup
]

{ #category : #accessing }
TypShaExamples >> lookupMethodNew [
	<gtExample>
	| resolver lookup |
	resolver := TypDepthFirstResolver resolver: TypShaMethodResolver new.
	lookup := TypMethodLookup
			receiver: TypNamedType class typAsType
			selector: #new
			arguments: #()
			parent: nil.
	self assert: (resolver canResolve: lookup).
	^ resolver resolve: lookup
]

{ #category : #accessing }
TypShaExamples >> lookupMethodNoNew [
	<gtExample>
	| lookup |
	lookup := TypMethodLookup
			receiver: ExternalType typAsType
			selector: #isAtomic
			arguments: #()
			parent: nil.
	self assert: (TypShaMethodResolver new canResolve: lookup).
	^ TypShaMethodResolver new resolve: lookup
]

{ #category : #accessing }
TypShaExamples >> lookupType [
	<gtExample>
	^ TypShaTypeResolver new
		resolve: (TypTypeLookup classDescription: Collection parent: nil)
]

{ #category : #accessing }
TypShaExamples >> lookupVariable [
	<gtExample>
	| lookup |
	lookup := TypVariableLookup
			receiver: GtPharoMethodCoder typAsType
			selector: #astCache
			parent: nil.
	self assert: (TypShaVariableResolver new canResolve: lookup).
	^ TypShaVariableResolver new resolve: lookup
]
