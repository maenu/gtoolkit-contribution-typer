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
			arguments: #().
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
			arguments: #().
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
			arguments: #().
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
			arguments: #().
	self assert: (TypShaMethodResolver new canResolve: lookup).
	^ TypShaMethodResolver new resolve: lookup
]

{ #category : #accessing }
TypShaExamples >> lookupType [
	<gtExample>
	| lookup resolver |
	resolver := TypTypeLookup resolver.
	lookup := TypTypeLookup classDescription: TypNamedType.
	self assert: (resolver canResolve: lookup).
	^ resolver resolve: lookup
]

{ #category : #accessing }
TypShaExamples >> lookupTypeAsType [
	<gtExample>
	TypTypeLookup invalidate.
	^ TypNamedType class typAsType
]

{ #category : #accessing }
TypShaExamples >> lookupTypeIndex [
	<gtExample>
	| lookup |
	lookup := TypTypeLookup classDescription: TypNamedType.
	^ TypTypeLookup resolver resolve: lookup
]

{ #category : #accessing }
TypShaExamples >> lookupVariable [
	<gtExample>
	| lookup |
	lookup := TypVariableLookup
			receiver: GtPharoMethodCoder typAsType
			selector: #astCache.
	self assert: (TypShaVariableResolver new canResolve: lookup).
	^ TypShaVariableResolver new resolve: lookup
]
