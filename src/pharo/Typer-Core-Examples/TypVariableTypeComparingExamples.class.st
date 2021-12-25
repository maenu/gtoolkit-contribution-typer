Class {
	#name : #TypVariableTypeComparingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Comparing'
}

{ #category : #accessing }
TypVariableTypeComparingExamples >> equality [
	<gtExample>
	| type copy superType |
	type := TypVariableTypeInitializingExamples new named.
	copy := type copy.
	superType := type super.
	self assert: type = type.
	self assert: type = copy.
	self assert: type hash = type hash.
	self assert: type hash = copy hash.
	self assert: type ~= superType.
	self assert: type hash ~= superType hash.
	^ type
]

{ #category : #accessing }
TypVariableTypeComparingExamples >> monotony [
	<gtExample>
	| type copy superType |
	type := TypVariableTypeInitializingExamples new named.
	copy := type copy.
	superType := type super.
	self flag: 'TODO should it really be bigger than itself?'.
	self assert: type > type.
	self assert: type > copy.
	self assert: copy > type.
	self assert: type > superType.
	self assert: superType > type.
	self assert: type >= type.
	self assert: type >= copy.
	self assert: copy >= type.
	self assert: type >= superType.
	self assert: superType >= type.
	self assert: type <= type.
	self assert: type <= copy.
	self assert: copy <= type.
	self assert: type <= superType.
	self assert: superType <= type.
	self assert: type < type.
	self assert: type < copy.
	self assert: copy < type.
	self assert: type < superType.
	self assert: superType < type.
	^ type
]
