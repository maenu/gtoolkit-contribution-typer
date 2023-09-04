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
	| lookup resolver |
	resolver := TypTypeIndex instance resolver.
	lookup := TypTypeLookup classDescription: TypNamedType parent: nil.
	self assert: (resolver canResolve: lookup).
	^ resolver resolve: lookup
]

{ #category : #accessing }
TypShaExamples >> lookupTypeAsType [
	<gtExample>
	TypTypeLookup invalidate.
	TypTypeIndex invalidate.
	^ TypNamedType class typAsType
]

{ #category : #accessing }
TypShaExamples >> lookupTypeIndex [
	<gtExample>
	^ TypTypeIndex instance lookupClassDescription: TypNamedType
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
